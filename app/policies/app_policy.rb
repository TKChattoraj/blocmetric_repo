class AppPolicy<ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.present? && scope.where(id: record.id).exists? && (record.user == user)
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
    user.present? && scope.where(id: record.id).exists? && (record.user == user)
  end

  def destroy?
    user.present? && scope.where(id: record.id).exists? && (record.user == user)
  end

  class Scope<Scope

    def resolve
      scope.where(user_id: @user)
    end
  end



end
