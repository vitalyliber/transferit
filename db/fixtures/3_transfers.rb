@description = 'Cмогу взять что-то небольшое, книгу или мягкую игрушку'

Transfer.seed(:id,
            {id: 1, description: @description, date: '2016-05-29', time: '09:00', user_id: '1', from_id: '1', to_id: '2'},
            {id: 2,  description: @description, date: '2016-05-30', time: '10:20', user_id: '2', from_id: '5', to_id: '1'},
            {id: 3,  description: @description, date: '2016-06-01', time: '11:10', user_id: '3', from_id: '4', to_id: '3'},
            {id: 4,  description: @description, date: '2016-06-02', time: '13:40', user_id: '4', from_id: '2', to_id: '5'},
            {id: 5,  description: @description, date: '2016-06-03', time: '12:10', user_id: '5', from_id: '5', to_id: '2'},
            {id: 6,  description: @description, date: '2016-06-04', time: '16:00', user_id: '6', from_id: '3', to_id: '1'},
            {id: 7,  description: @description, date: '2016-06-05', time: '18:00', user_id: '7', from_id: '2', to_id: '4'},
            {id: 8,  description: @description, date: '2016-06-06', time: '13:10', user_id: '8', from_id: '1', to_id: '3'},
            {id: 9,  description: @description, date: '2016-06-07', time: '18:30', user_id: '9', from_id: '4', to_id: '5'},
            {id: 10,  description: @description, date: '2016-06-08', time: '19:30', user_id: '10', from_id: '5', to_id: '1'}
)