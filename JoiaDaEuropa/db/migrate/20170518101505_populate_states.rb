class PopulateStates < ActiveRecord::Migration[5.0]

    def up

        State.delete_all
        State.create id:1, state: 'order_state.pending', created_at: Time.now, updated_at: Time.now
        State.create id:2, state: 'order_state.concluded', created_at: Time.now, updated_at: Time.now
        State.create id:3, state: 'order_state.cancelled', created_at: Time.now, updated_at: Time.now

    end

    def down

        State.delete(id: [1, 2, 3])

    end

end
