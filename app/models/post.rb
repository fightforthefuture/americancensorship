# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates_presence_of :post, :email, :name

  def censored_post
    self.post.gsub(/\w{4,}/) do |match|
      "█" * match.length
    end
  end
  
end
