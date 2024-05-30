output "state_infrastructure_outputs" {  
  value = {  
    for state, infrastructure in module.gcp_humangov_infrastructure :  
    state => {  
      instance_ip   = infrastructure.state_instance_ip  
      bucket_name   = infrastructure.state_bucket_name  
    }  
  }  
}
