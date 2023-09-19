def test_s3_bucket_exists():
    client = boto3.client('s3')
    response = client.list_buckets()
    buckets = [bucket['Name'] for bucket in response['Buckets']]
    assert "bucket-name" in buckets
