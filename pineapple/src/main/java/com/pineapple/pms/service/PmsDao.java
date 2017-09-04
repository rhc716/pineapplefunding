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
	
	@Override
	public void wbsactualinsert(WbsActual wbsactual){
		log.debug("PmsDao의wbsactualinsert호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.wbsactualinsert", wbsactual);
	}
	
	@Override
	public void wbsplanupdateetc(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdateetc", map);
	}
	@Override
	public void wbsplanupdatehuman(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdatehuman", map);
	}
	@Override
	public void wbsplanupdatefacility(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdatefacility", map);
	}
	@Override
	public void wbsplanupdateincome(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdateincome", map);
	}
	@Override
	public void wbsplanupdatematerial(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdatematerial", map);
	}
	@Override
	public void wbsplanupdateout(HashMap map){
		log.debug("PmsDao의wbsplanupdateetc호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanupdateout", map);
	}
	
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#WbsPlanSelect()
	 */

	@Override
	public List<WbsPlan> wbsplanlist(String milestoneCode){
		log.debug("PmsDao의 WbsPlanSelect호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.wbsplanlist", milestoneCode);
	}
	
	@Override
	public List<WbsMs> wbsmsview(String fdcode){
		log.debug("PmsDao의 wbsmsview호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.wbsmsview", fdcode);
	}
	/* (non-Javadoc)
	 * @see com.pineapple.pms.service.PmsDaoInterface#getMyWbsPlanDetail(java.lang.String)
	 */
	@Override
	public WbsPlan getMyWbsPlanDetail(String wbsplancode){
		log.debug("PmsDao의 selectWbsPlandetail호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.pms.service.PmsMapper.selectdetail",wbsplancode);
	}
	@Override
	public WbsActual wbsactualdetail(String wbsactualcode){
		log.debug("PmsDao의 wbsactualdetail호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.pms.service.PmsMapper.wbsactualdetail",wbsactualcode);
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
	public void wbsplanfacilityinsert(WbsPlanFacility wbsplanfacility){
		log.debug("PmsDao의 wbsplanfacilityinsert호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.wbsplanfacilityinsert", wbsplanfacility);
	}
	
	@Override
	public void wbsplanoutinsert(WbsPlanOut wbsplanout){
		log.debug("PmsDao의 wbsplanoutinsert호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.wbsplanoutinsert", wbsplanout);
	}
	
	@Override
	public void wbsplanetcinser(WbsPlanEtc wbsplanetc){
		log.debug("PmsDao의 addWbsplanMaterial호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.wbsplanetcinser", wbsplanetc);
	}
	
	@Override
	public void wbsplanincomeinsert(WbsPlanIncome wbsplanincome){
		log.debug("PmsDao의 wbsplanincomeinsert호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.wbsplanincomeinsert", wbsplanincome);
	}
	
	
	@Override
	public List<WbsPlanHuman> getMyWbsPlanHumanList(String wbsplancode){
		log.debug("PmsDao의 getMyWbsPlanHumanList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanHuman", wbsplancode);
	}
	
	@Override
	public WbsPlanUpdate wbsplanupdate(WbsPlan wbsplan){
		log.debug("PmsDao의 wbsplanupdate호출 성공");
		return sqlSessionTemplate.selectOne("com.pineapple.pms.service.PmsMapper.wbsplanupdate", wbsplan);
	}
	@Override
	public List<WbsPlanMaterial> getMyWbsPlanMaterialList(String wbsplancode){
		log.debug("PmsDao의 getMyWbsPlanMaterialList호출 성공");
		return sqlSessionTemplate.selectList("com.pineapple.pms.service.PmsMapper.selectWbsPlanMaterial", wbsplancode);
	}
	@Override
	public void deletewbsplan(String wbsplancode){
		log.debug("PmsDao의 deletewbsplan호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplan", wbsplancode);
	}
	@Override
	public void deletehuman(String wbsplancode){
		log.debug("PmsDao의 deletehuman호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletehuman", wbsplancode);
	}
	@Override
	public void deletematerial(String wbsplancode){
		log.debug("PmsDao의 deletematerial호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletematerial", wbsplancode);
	}
	@Override
	public void deletefacility(String wbsplancode){
		log.debug("PmsDao의 deletefacility호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletefacility", wbsplancode);
	}
	@Override
	public void deleteout(String wbsplancode){
		log.debug("PmsDao의 deleteout호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deleteout", wbsplancode);
	}
	@Override
	public void deleteetc(String wbsplancode){
		log.debug("PmsDao의 deleteetc호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deleteetc", wbsplancode);
	}
	@Override
	public void deleteincome(String wbsplancode){
		log.debug("PmsDao의 deleteincome호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deleteincome", wbsplancode);
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
	
	@Override
	public void deletewbsplanfacility(String wbfcode){
		log.debug("PmsDao의 deletewbsplanfacility호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanfacility", wbfcode);
	}
	@Override
	public void deletewbsplanout(String wbocode){
		log.debug("PmsDao의 deletewbsplanout호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanout", wbocode);
	}
	@Override
	public void deletewbsplanetc(String wbecode){
		log.debug("PmsDao의 deletewbsplanetc호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanetc", wbecode);
	}
	@Override
	public void deletewbsplanincome(String wbicode){
		log.debug("PmsDao의 deletewbsplanincome호출 성공");
		sqlSessionTemplate.insert("com.pineapple.pms.service.PmsMapper.deletewbsplanincome", wbicode);
	}
	
	@Override
	public void updatewbsplanhuman(WbsPlanHuman wbsplanhuman){
		log.debug("PmsDao의 updatewbsplanhuman호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.updatewbsplanhuman", wbsplanhuman);
	}
	
	@Override
	public void updatewbsplan(String wbsplancode){
		log.debug("PmsDao의 updatewbsplan호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.updatewbsplan", wbsplancode);
	}
	
	@Override
	public void wbsplanmaterialupdate(WbsPlanMaterial wbsplanmaterial){
		log.debug("PmsDao의 wbsplanmaterialupdate호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanmaterialupdate", wbsplanmaterial);
	}
	
	@Override
	public void wbsplanfacilityupdate(WbsPlanFacility wbsplanfacility){
		log.debug("PmsDao의 wbsplanfacilityupdate호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanfacilityupdate", wbsplanfacility);
	}

	@Override
	public void wbsplanoutupdate(WbsPlanOut wbsplanout){
		log.debug("PmsDao의 wbsplanoutupdate호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanoutupdate", wbsplanout);
	}
	
	@Override
	public void wbsplanetcupdate(WbsPlanEtc wbsplanetc){
		log.debug("PmsDao의 wbsplanetcupdate호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanetcupdate", wbsplanetc);
	}
	
	@Override
	public void wbsplanincomeupdate(WbsPlanIncome wbsplanincome){
		log.debug("PmsDao의 wbsplanincomeupdate호출 성공");
		sqlSessionTemplate.update("com.pineapple.pms.service.PmsMapper.wbsplanincomeupdate", wbsplanincome);
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
