package kr.co.mis.systemmisproject.mushroom;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MushroomMapper {
    public Mushroom selectOne(Mushroom mushroom);
}
