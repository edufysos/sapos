# encoding: utf-8
# Copyright (c) 2013 Universidade Federal Fluminense (UFF).
# This file is part of SAPOS. Please, consult the license terms in the LICENSE file.

class StudentsController < ApplicationController
  authorize_resource

  helper :student_majors
  
  active_scaffold :student do |config|
    config.list.sorting = {:name => 'ASC'}
    config.list.columns = [:name, :cpf, :enrollments]
    config.create.label = :create_student_label
    config.update.label = :update_student_label

#    config.columns[:birthdate].form_ui = :calendar_date_select         
    config.columns[:birth_city].form_ui = :select
    config.columns[:birth_state].form_ui = :hidden
    config.columns[:city].form_ui = :select
    config.columns[:civil_status].form_ui = :select
    config.columns[:identity_issuing_place].form_ui = ""
    
    #config.columns[:majors].form_ui = :record_select
    config.columns[:sex].form_ui = :select
    config.columns[:sex].options = {:options => [['Masculino', 'M'], ['Feminino', 'F']]}
    config.columns[:birthdate].options = {'date:yearRange' => 'c-100:c'}
    config.columns[:civil_status].options = {:options => ['Solteiro(a)', 'Casado(a)']}

    config.columns[:student_majors].includes = [:majors, :student_majors]

    config.columns =
        [:name,
         :photo,
         :sex,
         :civil_status,
         :birthdate,
         :city,
         :neighborhood,
         :address,
         :zip_code,
         :telephone1,
         :telephone2,
         :email,
         :employer,
         :job_position,
         :cpf,
         :identity_number,
         :identity_issuing_body,
         :identity_issuing_place, 
         :identity_expedition_date,
         :birth_state,
         :birth_city,
         :father_name,
         :mother_name,
         :obs,
         :student_majors]
  end

  record_select :per_page => 10, :search_on => [:name], :order_by => 'name', :full_text_search => true

end 