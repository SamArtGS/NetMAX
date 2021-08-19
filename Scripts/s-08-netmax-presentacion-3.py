import oci
import os
import io
import sys
from pathlib import Path
from oci.config import validate_config
from oci.object_storage import ObjectStorageClient

# configuration for connection to Oracle OCI
#
config = {
    "user": "ocid1.user.oc1..aaaaaaaayudzfyox7twtjhcwgk32x7dsw7tbk6eqnz3uh7z3p7vfayp6q6sa",
    "key_file": "jorgecrdenas.pem",
    "fingerprint": "63:fc:1d:c0:61:2f:dc:4c:4f:75:17:2f:67:dd:de:12",
    "tenancy": "ocid1.tenancy.oc1..aaaaaaaacn73zjt62gx6gwhqs5z5wbpidpvjs5likccvivhtfbdsl33i2tja",
    "region": "us-sanjose-1"
}

# check command line params
# bucket-objects
# C:\\Users\\Jorge\\Documents\\BDD\\carga-inicial\\pdfs
# C:\\Users\\Jorge\\Documents\\BDD\\carga-inicial\\trailers
def check_params():
    # verify input paramters
    N_PARAMS = 3 # awaited # of params
    n_params = len(sys.argv)

    if (n_params < (N_PARAMS + 1)):
        print("Usage: buckets.py bucket_name local_file_path_pdfs local_file_path_trailers")

        sys.exit(-1)
    else:
        print("Running with: ")
        print("Bucket name: {}".format(sys.argv[1]))
        print("File path pdfs: {}".format(sys.argv[2]))
        print("File path trailers: {}".format(sys.argv[3]))
        print("")
#
# Main
#
print("")
check_params()
validate_config(config)
print("Validate config OK")

bucket_name = sys.argv[1]
FILE_PATH_PDFS = sys.argv[2]
FILE_PATH_TRAILERS = sys.argv[3]

object_storage_client = ObjectStorageClient(config)

# get the namespace
namespace = object_storage_client.get_namespace().data

# PDFS
print("Uploading PDFs")
for FILE_NAME in os.listdir(FILE_PATH_PDFS):
  print('Uploading file {} ...'.format(FILE_NAME))
  object_storage_client.put_object(
    namespace, 
    bucket_name, 
    FILE_NAME, 
    io.open(os.path.join(Path(FILE_PATH_PDFS), FILE_NAME),'rb')
  )
# TRAILERS
print("Uploading Trailers")
for FILE_NAME in os.listdir(FILE_PATH_TRAILERS):
  print('Uploading file {} ...'.format(FILE_NAME))
  object_storage_client.put_object(
    namespace, 
    bucket_name, 
    FILE_NAME, 
    io.open(os.path.join(Path(FILE_PATH_TRAILERS), FILE_NAME),'rb')
  )

print("Upload completed !")
print("")