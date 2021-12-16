const String getParkingQuery = """
query getParking(\$id: Int!){
  getParking(id: \$id) {
    id
    name
    lat
    lng
    
    address {
      name
    }

    parking_slots {
      id
      number

      parkingSlotType {
        id
        is_bookable
        
        refSlotType {
          name
        }

        parking_slot_price {
          minutes
          price
        }
      }

      vehicle {
        register_number
      }
    }
  }
}
""";

const String parkingsQuery = """
 query parkings(
    \$endLat: String!,
    \$startLat: String!,
    \$endLng: String!,
    \$startLng: String!,
  ) 
    {
      parkings(
        range: {
          endLat: \$endLat
          startLat: \$startLat
          endLng: \$endLng
          startLng: \$startLng
        }
      ){
        id,
        lat,
        lng,
        name,
        freeSlots,
      }
    }
""";

// query parkings(
//     \$endLat: String!,
//     \$startLat: String!,
//     \$endLng: String!,
//     \$startLng: String!,
//
//   )
//     {
//       parkings(
//         range: {
//           endLat: \$endLat
//           startLat: \$startLat
//           endLng: \$endLng
//           startLng: \$startLng
//         }
//         time: {
//           duration: \$duration
//           start_time: \$startTime
//         }
//       ){

const String createBookingMutation = """
mutation createBooking(
    \$parkingId: Int!,
    \$parkingSlotId: Int!,
    \$vechicleNumber: String!,
    \$startDate: String!,
    \$endDate: String!,
    \$reservedDate: String!,
  )
    {
      createBooking (createBookingInput:{
        parking_id: \$parkingId
        parking_slot_id: \$parkingSlotId
        vehicle_number: \$vechicleNumber
        start_date: \$startDate
        end_date: \$endDate
        reserved_date: \$reservedDate
      }) {
        id
      }
    }
""";
