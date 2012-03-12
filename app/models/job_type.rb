# encoding: utf-8
class JobType < ActiveRecord::Base
  has_many :jobs
end
