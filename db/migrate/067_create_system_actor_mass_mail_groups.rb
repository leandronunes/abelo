class CreateSystemActorMassMailGroups < ActiveRecord::Migration
  def self.up
    create_table :system_actor_mass_mail_groups do |t|
      t.column :system_actor_id,           :integer
      t.column :mass_mail_group_id,        :integer
    end
  end

  def self.down
    drop_table :system_actor_mass_mail_groups
  end
end
