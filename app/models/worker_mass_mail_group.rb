class WorkerMassMailGroup < SystemActorMassMailGroup

  belongs_to :worker, :foreign_key => 'system_actor_id'
  belongs_to :worker_group, :foreign_key => 'mass_mail_group_id'

end
