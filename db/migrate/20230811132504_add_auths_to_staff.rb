class AddAuthsToStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs,:staff, :boolean,default: false
    add_column :staffs,:staff_category,:boolean, default: false
    add_column :staffs,:student,:boolean,default: false
    add_column :staffs,:guardian,:boolean,default: false
    add_column :staffs,:academic_year,:boolean,default: false
    add_column :staffs,:term,:boolean,default: false
    add_column :staffs,:form,:boolean,default: false
    add_column :staffs,:subject,:boolean,default: false
    add_column :staffs,:staff_subject,:boolean,default: false
    add_column :staffs,:student_subject,:boolean,default: false
    add_column :staffs,:assessment,:boolean,default: false
    add_column :staffs,:assessment_type,:boolean,default: false
  end
end
