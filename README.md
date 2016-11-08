# OCDXEngine
This is the overall architecture for the OCDX Repository collection 
## URL
  * ec2-35-160-28-84.us-west-2.compute.amazonaws.com
## Wiki
  * Wikibase is used to create manifests, following the manifest laid out in libbyh/ocdx.  A sparkle engine will be used to search for the collections
  * https://docs.google.com/document/d/1eyouf5pZJNSQW618xA-JStpfI8gW9idJlE5P3wCr0ko/edit?usp=sharing

## Reqs
  * https://docs.google.com/document/d/1taHixCv3siKWV6Z53MhWA9_cJzDl3t93crVsMrE218Y/edit?usp=sharing

## Architecture
* This is the overall architecture for the OCDX Repository collection
** Have wiki be able to launch a notebook, including the full contents of the collection (defined below)
* JupyterHub is used, following a K8S architecure described in 
* Each collection contains:
** A Manifest
** A pointer to a dataset (could be multiple files)
* *A Jupyter Hub Notebook Directory containing a set of notebooks 

