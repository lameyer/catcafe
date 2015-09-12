require 'test_helper'

class CafeTest < ActiveSupport::TestCase

  test "cafe not created without name" do
    cafe = Cafe.new
    assert_not cafe.save, "Saved cafe without a name"
  end

  test "cafe created with name" do
    cafe = Cafe.new(name: "Fun Times Cafe")
    assert cafe.save, "Didn't save cafe with name"
  end

  test "cafe actually has room" do
    cafe = Cafe.create(name: "Empty", litter_box_capacity: 1, poop_count: 0, user_id: users(:rich).id)
    item = items(:one)
    cafe_item = CafeItem.create(cafe_id: cafe.id, item_id: item.id)
    assert cafe.has_room?
  end

  test "cafe doesn't have room when litter box is full" do
    cafe = Cafe.create(name: "Empty", litter_box_capacity: 1, poop_count: 1, user_id: users(:rich).id)
    item = items(:one)
    cafe_item = CafeItem.create(cafe_id: cafe.id, item_id: item.id)
    assert_not cafe.has_room?
  end

  test "cafe doesn't have room when litter box is over full" do
    cafe = Cafe.create(name: "Empty", litter_box_capacity: 1, poop_count: 2, user_id: users(:rich).id)
    item = items(:one)
    cafe_item = CafeItem.create(cafe_id: cafe.id, item_id: item.id)
    assert_not cafe.has_room?
  end

  test "cafe doesn't have room when it has no items" do
    cafe = Cafe.create(name: "Empty", litter_box_capacity: 1, poop_count: 0, user_id: users(:rich).id)
    assert_not cafe.has_room?
  end

  test "cafe doesn't have room when no items are free" do
    cafe = Cafe.create(name: "Empty", litter_box_capacity: 1, poop_count: 2, user_id: users(:rich).id)
    item = items(:one)
    cafe_item = CafeItem.create(cafe_id: cafe.id, item_id: item.id)
    cafe_visit = CafeVisit.create(cafe_id: cafe.id, cat_id: cats(:gerard).id, entered_at: Time.now)
    cafe_item_visit = CafeItemVisit.create(cat_id: cats(:gerard).id, cafe_item_id: cafe_item.id,
      cafe_visit_id: cafe_visit.id, entered_at: Time.now)
    assert_not cafe.has_room?
  end

end
