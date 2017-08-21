package com.pineapple.pms.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pineapple.funding.service.Funding;

@Repository
public class PmsDao implements PmsDaoInterface {
	private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#insertWbsPlan(com.pineapple.pms.service.WbsPlan)
	 */
	@Override
	public void insertWbsPlan(WbsPlan wbsplan){
		log.debug("PmsDao의insertWbsplan호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlan", wbsplan);
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#WbsPlanSelect()
	 */
	@Override
	public List<WbsPlanView> WbsPlanSelect(String userId){
		log.debug("PmsDao의 WbsPlanSelect호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlan", userId);
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#getMyWbsPlanDetail(java.lang.String)
	 */
	@Override
	public WbsPlanView getMyWbsPlanDetail(String wbsplancode){
		log.debug("PmsDao의 selectWbsPlandetail호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.pms.service.PmsMapper.selectdetail",wbsplancode);
	}
	@Override
	public void addWbsplanhuman(WbsPlanHuman wbsplanhuman){
		log.debug("PmsDao의 insertWbsPlanHuman호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlanHuman", wbsplanhuman);
	}
	@Override
	public void addWbsplanMaterial(WbsPlanMaterial wbsplanmaterial){
		log.debug("PmsDao의 addWbsplanMaterial호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.insertWbsPlanMaterial", wbsplanmaterial);
	}
	
	@Override
	public List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode){
		log.debug("PmsDao의 getMyWbsPlanHumanList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanHuman", wbsplancode);
	}
	@Override
	public List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode){
		log.debug("PmsDao의 getMyWbsPlanMaterialList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanMaterial", wbsplancode);
	}
	@Override
	public void deletewbsplanhuman(String wbhcode){
		log.debug("PmsDao의 deletewbsplanhuman호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanhuman", wbhcode);
	}
	
	@Override
	public void deletewbsplanmaterial(String wbmcode){
		log.debug("PmsDao의 deletewbsplanmaterial호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanmaterial", wbmcode);
	}

	public void updatewbsplanhuman(WbsPlanHuman wbsplanhuman){
		log.debug("PmsDao의 updatewbsplanhuman호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.updatewbsplanhuman", wbsplanhuman);
	}

	@Override
	public List<WbsPlanFacility> getMyWbsPlanFacilityList(String wbsplancode) {
		log.debug("PmsDao의 getMyWbsPlanFacilityList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanFacility", wbsplancode);
	}
	
	@Override
	public List<WbsPlanOut> getMyWbsPlanOutList(String wbsplancode) {
		log.debug("PmsDao의 getMyWbsPlanOutList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanOut", wbsplancode);
	}
	@Override
	public List<WbsPlanEtc> getMyWbsPlanEtcList(String wbsplancode) {
		log.debug("PmsDao의 getMyWbsPlanFacilityList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanEtc", wbsplancode);
	}
	@Override
	public List<WbsPlanIncome> getMyWbsPlanIncomeyList(String wbsplancode) {
		log.debug("PmsDao의 getMyWbsPlanIncomeyList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanIncome", wbsplancode);
	}
}
