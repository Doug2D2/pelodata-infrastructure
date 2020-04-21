resource "aws_dynamodb_table" "pelodata_custom_programs" {
    name           = "PelodataCustomPrograms"
    hash_key       = "Id"
    write_capacity = 10
    read_capacity  = 10
    
    attribute {
        name = "Id"
        type = "S"
    }
    
    tags = {
        Name = "Pelodata-DB"
        App  = "Pelodata"   
    }
}
