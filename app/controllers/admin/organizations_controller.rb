class Admin::OrganizationsController < Admin::AdminController
  before_action :set_organization, except: [:index]

  def index
    @organizations = Organization.all
  end

  def new; end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to admin_organizations_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @organization.update(organization_params)
      redirect_to admin_organizations_path
    else
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to admin_organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def set_organization
    @organization = Organization.find_or_initialize_by(id: params[:id])
  end
end
