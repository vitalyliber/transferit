@id = 10
@description = 'Cмогу взять что-то небольшое, книгу или мягкую игрушку'

1.upto(100) do
  Transfer.seed(:id,
                {id: @id += 1, description: @description, date: '2016-05-29', time: '09:00', user_id: '1', from_id: '1', to_id: '2'}
  )
end
