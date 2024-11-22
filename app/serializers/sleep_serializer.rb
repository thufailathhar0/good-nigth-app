class SleepSerializer < ActiveModel::Serializer
  attributes :id, :clock_in, :clock_out, :duration, :created_at

  def duration
    object.duration
  end
end
