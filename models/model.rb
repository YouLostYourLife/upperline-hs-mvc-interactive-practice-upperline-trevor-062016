def get_days_selected
  @days_selected = []
  @days_selected.push(params[:monday_night])
  @days_selected.push(params[:tuesday_night])
  @days_selected.push(params[:wednesday_night])
  @days_selected.push(params[:thursday_night])
  @days_selected.push(params[:friday_night])
  @days_selected.push(params[:saturday_night])
  @days_selected.push(params[:sunday_night])
  @days_selected.delete("")
  @days_selected.delete(nil)
  return @days_selected
end
