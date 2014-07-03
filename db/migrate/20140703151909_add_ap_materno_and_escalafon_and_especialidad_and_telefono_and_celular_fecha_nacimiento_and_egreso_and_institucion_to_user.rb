class AddApMaternoAndEscalafonAndEspecialidadAndTelefonoAndCelularFechaNacimientoAndEgresoAndInstitucionToUser < ActiveRecord::Migration
  def change
    add_column :users, :ap_materno, :string
    add_column :users, :escalafon, :string
    add_column :users, :especialidad, :string
    add_column :users, :telefono, :integer
    add_column :users, :celular, :integer
    add_column :users, :fecha_nacimiento, :date
    add_column :users, :egreso, :integer
    add_column :users, :institucion, :string
  end
end
