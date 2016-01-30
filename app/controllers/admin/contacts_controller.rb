class Admin::ContactsController < AdminController
  before_action :set_admin_contact, only: [:show, :edit, :update, :destroy]

  # GET /admin/contacts
  # GET /admin/contacts.json
  def index
    @admin_contacts = Admin::Contact.all
    @admin_contact = Admin::Contact.first
    render :show
  end

  # GET /admin/contacts/1
  # GET /admin/contacts/1.json
  def show
  end

  # GET /admin/contacts/new
  def new
    @admin_contact = Admin::Contact.new
  end

  # GET /admin/contacts/1/edit
  def edit
  end

  # POST /admin/contacts
  # POST /admin/contacts.json
  def create
    @admin_contact = Admin::Contact.new(admin_contact_params)

    respond_to do |format|
      if @admin_contact.save
        format.html { redirect_to @admin_contact }
        format.json { render :show, status: :created, location: @admin_contact }
      else
        format.html { render :new }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contacts/1
  # PATCH/PUT /admin/contacts/1.json
  def update
    respond_to do |format|
      if @admin_contact.update(admin_contact_params)
        format.html { redirect_to @admin_contact }
        format.json { render :show, status: :ok, location: @admin_contact }
      else
        format.html { render :edit }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contacts/1
  # DELETE /admin/contacts/1.json
  def destroy
    @admin_contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_contact
      @admin_contact = Admin::Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_contact_params
      params.require(:admin_contact).permit(:name, :email, :phone, :fixed_phone, :address)
    end
end
