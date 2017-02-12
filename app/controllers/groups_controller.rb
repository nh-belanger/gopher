class GroupsController < ApplicationController
  # before_action :authorize_member, except: [:index, :show]

  def index
    @groups = Group.all
    @member_can_create = !current_member.nil?
    @view_all = true
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to member_groups_path
    flash[:notice] = "Group was Deleted"
  end

  def edit
    @group = Group.find(params[:id])
    @member = @group.members.first

    unless can_change?(@group)
      raise ActionController::RoutingError.new("Not Found")
    end

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@group)
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members
    @member = @group.members.first
    @group_requests = Grouprequest.where(group_id: @group.id)

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@group)
    end
  end

  # TODO: make it so a group you are in cannot be joined twice
  # TODO: make is so you can leave a group

  def join
    @group = Group.find(params[:group_id])

    Membership.create(group: @group, member: current_member)
    Grouprequest.where(group_id: @group.id, member_id: @group.members.last.id).destroy_all

    if @group.save
      flash[:notice] = "Join request granted."
      redirect_to member_groups_path
    end
  end

  def joinrequest
    @group = Group.find(params[:group_id])

    Grouprequest.create(member_id: current_member.id, group_id: @group.id)


    flash[:notice] = "You requested to joined #{@group.name}."
    redirect_to member_groups_path
  end


  def change_view
    @view_all = false
    redirect_to member_groups_path
  end

  def create
    @group = Group.new(group_params)

    @member = Member.find(params[:member_id])

    if @group.save
      flash[:notice] = "group reserved"
      Membership.create(member: current_member, group: @group)
      redirect_to member_groups_path
    else
      flash[:notice] = "group was not created"
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])

    unless can_change?(@group)
      raise ActionController::RoutingError.new("Not Found")
    end

    if @group.update(group_params)
      flash[:notice] = "You edited a group."
      redirect_to member_group_path(@group)
    else
      flash[:notice] = @item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def new
    @member = Member.find(params[:member_id])
    @group = Group.new
  end

  # TODO: can't join group if 4 or more people already joined
  # TODO: fix can't join if set to unjoinable

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def can_change?(group)
    # current_member == group.members.first || current_member.role == "admin"
    current_member.role == "admin" || current_member == group.members.first
  end

  def authorize_member
    # if !member_signed_in? || !current_member.admin?
    if !member_signed_in? || !current_member.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
