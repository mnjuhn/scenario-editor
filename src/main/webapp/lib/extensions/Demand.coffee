window.beats.Demand::vehicle_type_id = ->
  @get('vehicleType_id')

window.beats.Demand::set_vehicle_type_id = (id) ->
  @set('vehicleType_id', id)

# get demand, at dt offset
window.beats.Demand::demand = (offset) ->
  # create array of demand values
  demands = @get('text')?.split(',') || []
  demand = null
  # check if offset is out of bounds
  if demands.length > offset
    demand = demands[offset]
  demand

# set demand, at dt offset
window.beats.Demand::set_demand = (demand, offset) ->
  # create array of demand values
  demands = @get('text')?.split(',') || []
  # check if offset is out of bounds
  if demands.length > offset
    demands[offset] = demand
    # otherwise add demand to end of array
  else
    demands.push(demand)
  @set('text', demands.join())

# get demand database id, at dt offset
window.beats.Demand::ident = (offset) ->
  # create array of ids
  ids = @get('ids')?.split(',') || []
  id = null
  # check if offset is out of bounds
  if ids.length > offset
    id = ids[offset]
  id

# set demand database id, at dt offset
window.beats.Demand::set_ident = (id, offset) ->
  # create array of id values
  ids = @get('ids')?.split(',') || []
  # check if offset is out of bounds
  if ids.length > offset
    ids[offset] = id
    # otherwise add id to end of array
  else
    ids.push(id)
  @set('ids', ids.join())

# get demand crudflag, at dt offset
window.beats.Demand::crud = (offset) ->
  # create array of crudFlags
  crudFlags = @get('crudFlags')?.split(',') || []
  crudFlag = null
  # check if offset is out of bounds
  if crudFlags.length > offset
    crudFlag = crudFlags[offset]
  crudFlag

# set crudflag, at dt offset
window.beats.Demand::set_crud = (crudFlag, offset) ->
  # create array of crudFlag values
  crudFlags = @get('crudFlags')?.split(',') || []
  # check if offset is out of bounds
  if crudFlags.length > offset
    crudFlags[offset] = crudFlag
    # otherwise add crudFlag to end of array
  else
    crudFlags.push(crudFlag)
  @set('crudFlags', crudFlags.join())

# Return True if demand has the same vehicle type id
window.beats.Demand::equals = (vehicle_type_id) ->
  # check if vehicle_type_id matches
  if @vehicle_type_id() == vehicle_type_id
    return true
  else
    return false

# Return the number of demands defined (ie. number of offsets)
window.beats.Demand::max_offset = () ->
  # get comma seperated demand values, if none exist set demands to empty array
  demands = @get('text')?.split(',') || []
  demands.length