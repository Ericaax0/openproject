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

module Projects
  module Statuses
    Status = Data.define(:id, :color)

    ON_TRACK = Status.new(id: "on_track", color: Color.new(hexcode: "#006edb"))
    AT_RISK = Status.new(id: "at_risk", color: Color.new(hexcode: "#006edb"))
    OFF_TRACK = Status.new(id: "off_track", color: Color.new(hexcode: "#d1242f"))
    NOT_STARTED = Status.new(id: "not_started", color: Color.new(hexcode: "#006edb"))
    FINISHED = Status.new(id: "finished", color: Color.new(hexcode: "#006edb"))
    DISCONTINUED = Status.new(id: "discontinued", color: Color.new(hexcode: "#006edb"))

    AVAILABLE = [
      ON_TRACK,
      AT_RISK,
      OFF_TRACK,
      NOT_STARTED,
      FINISHED,
      DISCONTINUED
    ].freeze
  end
end
