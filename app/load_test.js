import http from 'k6/http';
import { sleep, check } from 'k6';

export let options = {
    vus: 2000,           // 동시 사용자 수
    duration: '150s',   // 테스트 시간
};

export default function () {
    let res = http.get('http://192.168.119.136:8088/');
    check(res, { 'status was 200': (r) => r.status === 200 });
    sleep(0.1);
}
