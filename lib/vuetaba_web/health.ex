# Copyright (c) 2022 Andrey Mukamolov
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

defmodule VuetabaWeb.Health do
    @moduledoc """
    Check various health attributes of the application
    """
  
  
    @doc """
    Check if required services are loaded and startup
    tasks completed
    """
    def has_started? do
      is_alive?()
    end
  
  
    @doc """
    Check if app is alive and working, by making a simple
    request to the DB
    """
    def is_alive? do
      !!Ecto.Adapters.SQL.query!(MyApp.Repo, "SELECT 1")
    rescue
      _e -> false
    end
  
  
    @doc """
    Check if app should be serving public traffic
    """
    def is_ready? do
      Application.get_env(:vuetaba, :maintenance_mode) != :enabled
    end
  end
