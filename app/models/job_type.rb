# encoding: utf-8
class JobType < ActiveRecord::Base
  has_many :jobs
  has_many :estimates
  
end
