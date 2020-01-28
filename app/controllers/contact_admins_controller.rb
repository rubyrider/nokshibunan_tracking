class ContactAdminsController < InheritedResources::Base

  def index

  end

  def about

  end

  def create

  end

  private

    def contact_admin_params
      params.require(:contact_admin).permit(:name, :email, :contact_number, :message)
    end

end
