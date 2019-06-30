package com.itszt.elec.service.cache;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator--善知  on 2018/5/18.
 */
public abstract class CommonCache {
    @Autowired
    protected RedisTemplate redisTemplate;

    protected void setOneBean(Object bean, String... keys) {
        String key = genKey(keys);
        redisTemplate.opsForValue().set(key, JSON.toJSONString(bean));
    }

    protected <T> T getOneBean(Class<T> clazz,String... keys) {
        String key = genKey(keys);
        Object o = redisTemplate.opsForValue().get(key);
        if (o==null) {
            return null;
        }
        String json=o.toString();

        return JSON.parseObject(json,clazz);

    }

    protected void saveListStrings(List<String> datas,String... keys){
        redisTemplate.opsForList().rightPushAll(genKey(keys),datas);

    }


    protected List<String> getListStrings(String... keys){
      return   redisTemplate.opsForList().range(genKey(keys),0,-1);
    }


    protected void saveListBeans(List beans,String... keys){
        List<String> jsons=new ArrayList<>();

        for (Object bean : beans) {
            jsons.add(JSON.toJSONString(bean));
        }
        saveListStrings(jsons,keys);

    }

    protected <T> List<T> getListBeans(Class<T> clazz,String... keys){

        List<String> jsons = getListStrings(keys);

        List list=new ArrayList();
        for (String json : jsons) {
            list.add(JSON.parseObject(json,clazz));
        }
        return list;
    }

    /*
        删除指定key数据
     */
    public void deleteOneData(String... key){
        redisTemplate.delete(genKey(key));

    }


    /*
        生成key
     */
    private String genKey(String... keys) {

        StringBuilder stringBuilder = new StringBuilder(this.getClass().getSimpleName());

        for (String s : keys) {

            stringBuilder.append(":");
            stringBuilder.append(s);
        }
        return stringBuilder.toString().toLowerCase();

    }
}
