class CustomerMassMailGroup < SystemActorMassMailGroup

  belongs_to :customer, :foreign_key => 'system_actor_id'
  belongs_to :customer_group, :foreign_key => 'mass_mail_group_id'

end
