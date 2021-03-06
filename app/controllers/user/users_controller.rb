class User::UsersController < DashboardController

  def index
    organization = current_user.organization
    @users = User.where(organization_id: organization.id).where.not(id: current_user.id)
  end

  def dashboard; end

  def calendar;  end

  def edit; end

  def update
    if old_password_wrong?
      redirect_back(fallback_location: root_path)
    elsif current_user.update(user_params)
      bypass_sign_in current_user
      redirect_to user_root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    permit_params = [:name, :organization_id, :email, :role]
    permit_params << [:password, :password_confirmation] if password_present?
    params.require(:user).permit(permit_params)
  end

  def password_present?
    params[:user][:password].present?
  end

  def old_password_wrong?
    return false unless password_present?
    !current_user.valid_password?(params[:user][:old_password])
  end

end
