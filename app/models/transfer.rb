class Transfer < ActiveRecord::Base
 enum transfer_type: [:post, :necessary]
end
