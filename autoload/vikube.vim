
fun! vikube#kubectl_ns(action, namespace, ...)
  return printf("oc %s --namespace=%s ", a:action, a:namespace) . join(a:000, ' ')
endf

fun! vikube#get_pod_containers(namespace, pod)
  let cmd = "oc get --namespace=" . a:namespace . ' pod ' . a:pod . " -o=go-template --template '{{range .spec.containers}}{{.name}}{{\"\\n\"}}{{end}}'"
  let out = system(cmd)
  return split(out)
endf

fun! vikube#get_current_context()
  return split(system("oc config current-context"))[0]
endf

fun! vikube#get_namespaces()
  return split(system("oc get namespace --no-headers | awk '{ print $1 }'"))
endf
