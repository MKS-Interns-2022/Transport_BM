class AddValidationToTransportPlan < ActiveRecord::Migration[7.0]
  def change
    change_column TransportPlan, :reference_no, :string, null: false
    change_column TransportPlan, :plan_type, :string, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
