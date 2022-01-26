pragma solidity >=0.5.12<=0.8.0;

contract Shipping
{
    // 배송 상태는 pending, shipped, deliverd 세가지만 올 수있으므로 배송상태에 대한 사용자 정의 타입을 지정.
    enum ShippingStatus { Pending, Shipped, Delivered }

    // 배송 상태 외부에서 접근해 함부로 변경을 못하게 함.
    ShippingStatus private status;

    // 배송상태가 변경 될 때마다 발생하는 이벤트.
    event LogNewAlert(string description);

    // 배송계약이 호출되면 생성자는 배송상태를 pending으로 초기 지정. 
    constructor() public {
        status = ShippingStatus.Pending;
    }

    // 배송이 시작되면 호출되는 함수
    function Shipped() public {
        status = ShippingStatus.Shipped;

        // 함수가 호출되면 이벤트가 발생. 로그에 기록
        emit LogNewAlert("Your package has been shipped");
    }

    // 배송이 완료되면 호출되는 함수
    function Delivered() public {
        status = ShippingStatus.Delivered;

        emit LogNewAlert("Your package has arrived");
    }

    // 상태를 리턴 이 함수는 현재 상태를 변경할 수 없음.
    function getStatus(ShippingStatus _status) internal pure returns (string memory) {
     // Check the current status and return the correct name
     if (ShippingStatus.Pending == _status) return "Pending";
     if (ShippingStatus.Shipped == _status) return "Shipped";
     if (ShippingStatus.Delivered == _status) return "Delivered";
    }

   // 상품의 배송상태를 리턴
    function Status() public view returns (string memory) {
         ShippingStatus _status = status;
         return getStatus(_status);
    }

}