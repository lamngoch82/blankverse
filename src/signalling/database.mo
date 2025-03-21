import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import List "mo:base/List";
import Types "./types";

module {

    public class Connections() {

        public type ConnectionDetails = Types.ConnectionDetails;
        let connectionsMap = HashMap.HashMap<Text, List.List<ConnectionDetails>>(1, Text.equal, Text.hash);

        public func addConnectionRequest(initiator : Text, recipient : Text, typeof : Text, sdp : Text) {
            // find the recipient in the hashmap
            // add connectionDetails to the list.
            var connectionRequests : List.List<ConnectionDetails> = switch (connectionsMap.get(recipient)) {
                case null List.nil<ConnectionDetails>();
                case (?result) result;
            };
            connectionRequests := List.push({ typeof = typeof; sdp = sdp; initiator = initiator; recipient = recipient }, connectionRequests);
            connectionsMap.put(recipient, connectionRequests);
        };

        public func getConnectionRequest(principal : Text) : ?ConnectionDetails {
            // find key for the principal
            // pop a connectionRequest from the list
            let connectionRequests : List.List<ConnectionDetails> = switch (connectionsMap.get(principal)) {
                case null List.nil<ConnectionDetails>();
                case (?result) result;
            };
            let (connectionRequest, poppedList) = List.pop(connectionRequests);
            connectionsMap.put(principal, poppedList);
            return connectionRequest;
        };

    };
};
