class AppPolicy<ApplicationPolicy

  def index?
    if user.present?
      scope.where(user_id: user.id)
    else
      nil
    end
  end

  def show?
    scope.where(:id => record.id).exists?
    user.present? && (record.user == user)
  end

  def create?
    new?
  end

  def new?
    user.present?
  end

  def update?
    edit?
  end

  def edit?
    user.present? && (record.user == user)
  end

  def destroy?
    user.present? && (record.user == user)
  end

  class Scope<Scope

    def resolve
      scope.where(user_id: @user)
    end
  end



end
