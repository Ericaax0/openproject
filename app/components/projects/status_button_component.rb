# frozen_string_literal: true

#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
#++

class Projects::StatusButtonComponent < OpPrimer::StatusButtonComponent
  include ProjectStatusHelper

  attr_reader :project, :user

  def initialize(project:, user:, readonly: false, button_arguments: {}, menu_arguments: {})
    @project = project
    @user = user

    super(
      current_status: map_status_code(project.status_code),
      items: available_statuses,
      readonly:,
      button_arguments:,
      menu_arguments:
    )
  end

  def default_button_title
    I18n.t("js.label_edit_status")
  end

  def disabled?
    !user.allowed_in_project?(:edit_project, project)
  end

  def highlight_class_name(status, style)
    case style
    when :inline
      "project-status--name #{project_status_css_class(status.color_ref)}"
    when :background
      "project-status--background #{project_status_css_class(status.color_ref)}"
    end
  end

  private

  def available_statuses
    Project
      .status_codes
      .keys
      .map { map_status_code(it) }
  end

  def map_status_code(status_code)
    OpPrimer::StatusButtonOption.new(
      name: project_status_name(status_code),
      color_namespace: "project_status",
      color_ref: status_code,
      # icon: :'issue-opened'
    )
  end
end
