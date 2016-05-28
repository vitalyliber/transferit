@description = 'Необходимо передать документы'

Parcel.seed(:id,
          { id: 1, description: @description, date: '2016-05-29', user_id: '1', from_id: '1', to_id: '2'},
          { id: 2, description: @description, date: '2016-05-30', user_id: '2', from_id: '5', to_id: '1'},
          { id: 3, description: @description, date: '2016-05-31', user_id: '3', from_id: '4', to_id: '3'},
          { id: 4, description: @description, date: '2016-05-32', user_id: '4', from_id: '2', to_id: '5'},
          { id: 5, description: @description, date: '2016-05-33', user_id: '5', from_id: '5', to_id: '2'},
          { id: 6, description: @description, date: '2016-05-34', user_id: '6', from_id: '3', to_id: '1'},
          { id: 7, description: @description, date: '2016-05-35', user_id: '7', from_id: '2', to_id: '4'},
          { id: 8, description: @description, date: '2016-05-36', user_id: '8', from_id: '1', to_id: '3'},
          { id: 9, description: @description, date: '2016-05-37', user_id: '9', from_id: '4', to_id: '5'},
          { id: 10, description: @description, date: '2016-05-38', user_id: '10', from_id: '5', to_id: '1'}
)