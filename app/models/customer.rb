class Customer < SystemActor

  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'
  
#TODO see if it's needed
  def self.search(search_args, possible_ids = [], options = {} )
       return [] unless search_args

       search_args = '%' + search_args + '%'
       the_class = Customer 
       searched_people = Array.new
       if options == nil
         searched_people = the_class.find(:all, :conditions => [ '(name LIKE :search)', { :search =>  search_args } ] ).reject { |p| not possible_ids.include? p.id.to_s }
       else
      options.each_key { |o|
        if o == 'name'
          searched_people= searched_people + the_class.find(:all, :conditions => [ 'name LIKE :search', { :search =>  search_args } ] ).reject { |p| not possible_ids.include? p.id }
        elsif o == 'cpf'
          searched_people= searched_people + the_class.find(:all, :conditions => [ 'cpf LIKE :search', { :search =>  search_args } ] ).reject { |p| not possible_ids.include? p.id }
        elsif o == 'rg'
          searched_people= searched_people + the_class.find(:all, :conditions => [ 'rg LIKE :search', { :search =>  search_args } ] ).reject { |p| not possible_ids.include? p.id }
        end
      }

    end
    searched_people.uniq
  end

#TODO see if it's needed
  def list_by_categories()

  end

end
