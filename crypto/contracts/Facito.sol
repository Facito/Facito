pragma solidity ^0.4.24; // Set compiler version

// Token contract
contract Facito {
    string public constant name = "Facito"; // Name
    string public constant symbol = "FAC"; // Symbol
    uint8 public constant decimals = 18; // Set precision points
    uint256 public totalSupply; // Store total supply

    mapping(string => Article) public articles; // Store articles

    event Transfer (
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approve (
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    event NewArticle (
        string _ID,
        address _author,
        string _title
    );

    event ReadArticle (
        string _ID,
        address _author,
        address _reader,
        string _title
    );

    struct Article {
        string Title;
        string ID;
        string Content;
        string HeaderSource;
        address Author;
        mapping(address => uint) UnspentOutputs;
    }

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[this] = _initialSupply; // Set contract balance
        totalSupply = _initialSupply; // Set total supply
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance"); // Check for invalid balance

        balanceOf[msg.sender] -= _value; // Set sender balance
        balanceOf[_to] += _value; // Set recipient balance

        emit Transfer(msg.sender, _to, _value); // Emit transfer event

        return true; // Return success
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value; // Set allowance

        emit Approve(msg.sender, _spender, _value); // Emit approve event

        return true; // Return success
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from], "Insufficient balance"); // Check allowance is valid
        require(_value <= allowance[_from][msg.sender], "Insufficient balance"); // Check allowance is valid

        balanceOf[_from] -= _value; // Remove from sender
        balanceOf[_to] += _value; // Add to destination

        allowance[_from][msg.sender] -= _value; // Remove allowance

        emit Transfer(_from, _to, _value); // Emit transfer event

        return true; // Return success
    }

    function newArticle(string _title, string _content, string _headerSource) public returns (bool success) {
        string memory _id = bytes32ToString(keccak256(abi.encodePacked(_title, _content, _headerSource, msg.sender))); // Hash ID

        emit NewArticle(_id, msg.sender, _title); // Emit new article

        Article memory article = Article(_title, _id, _content, _headerSource, msg.sender); // Initialize article

        articles[bytes32ToString(keccak256(abi.encodePacked(_title, _content, _headerSource, msg.sender)))] = article; // Push new article

        return true; // Return success
    }

    function readArticle(string _id) public returns (bool success) {
        require(articles[_id].UnspentOutputs[msg.sender] == 0, "Article already read"); // Check article hasn't already been read
        require(articles[_id].Author != msg.sender, "Author cannot read own article"); // Check author isn't reading own article

        emit ReadArticle(_id, articles[_id].Author, msg.sender, articles[_id].Title); // Emit read article

        articles[_id].UnspentOutputs[msg.sender] = 1; // Set spent

        transfer(msg.sender, (balanceOf[this]/totalSupply)*2); // Transfer coins to reader
        transfer(articles[_id].Author, (balanceOf[this]/totalSupply)*10); // Transfer coins to author

        return true; // Return success
    }

    function bytes32ToString(bytes32 x) internal pure returns (string) {
        bytes memory bytesString = new bytes(32);

        uint charCount = 0;

        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }

        bytes memory bytesStringTrimmed = new bytes(charCount);
        
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }

        return string(bytesStringTrimmed);
    }
}