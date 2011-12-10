# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates_presence_of :post, :email, :name

  def censored_post
    self.post.gsub(/(the|a|who|what|I|i|where|huh)/) do |match|
      "█" * match.length
    end
  end
  
end
