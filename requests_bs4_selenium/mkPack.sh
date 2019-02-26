run_container () {
    docker run -v $(pwd):/outputs --name lambdapack_requests -d amazonlinux:1 tail -f /dev/null
}

build_pack () {
    docker exec -it lambdapack_requests /bin/bash /outputs/buildPack.sh
} 

stop_container() {
    docker container stop lambdapack_requests
}

remove_container () {
    docker container rm lambdapack_requests
}

main () {
    run_container
    build_pack
    stop_container
    remove_container
}

main


