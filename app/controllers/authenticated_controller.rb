# -*- encoding : utf-8 -*-
class AuthenticatedController < ApplicationController
  before_filter :login_required
end
