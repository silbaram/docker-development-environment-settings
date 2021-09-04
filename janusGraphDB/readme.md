# docker-compose 실행
```bash
docker-compose up -d
```

# gremlin console 접속

```bash
docker run --rm --link jce-janusgraph:janusgraph -e GREMLIN_REMOTE_HOSTS=jce-janusgraph --network janusgraphdb_jce-network \
    -it janusgraph/janusgraph:latest ./bin/gremlin.sh
```

# gremlin console에서 tinkerpop.server 연결
```bash
gremlin> :remote connect tinkerpop.server conf/remote.yaml session
gremlin> :remote console
```

# 예제 데이터 로드
```bash
gremlin> GraphOfTheGodsFactory.load(graph)
```

# cassandra 접속
```bash
docker exec -it jce-cassandra cqlsh
```