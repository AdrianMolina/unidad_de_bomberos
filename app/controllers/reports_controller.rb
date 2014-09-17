class ReportsController < ApplicationController
  def asistencia_incendios
    @usuarios = User.all
  end

  def asistencia_rescates
    @usuarios = User.all
  end

  def asistencia_explosivos
    @usuarios = User.all
  end

  def asistencia_pre_hospitalarios
    @usuarios = User.all
  end
end
