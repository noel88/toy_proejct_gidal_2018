//package org.gidal.gidalv2.config;
//
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.mybatis.spring.SqlSessionFactoryBean;
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.io.Resource;
//import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
//import org.springframework.web.servlet.ViewResolver;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//import org.springframework.web.servlet.view.InternalResourceViewResolver;
//
//import javax.sql.DataSource;
//
//@Configuration
//@MapperScan(value={"org.gidal.gidalv2.**.mapper"})
//public class WebConfig extends WebMvcConfigurerAdapter {
//
//    @Bean
//    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
//        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//        sqlSessionFactoryBean.setDataSource(dataSource);
//        Resource[] arrResource = new PathMatchingResourcePatternResolver()
//                .getResources("classpath:org/gidal/gidalv2/**/mapper/*.xml");
//        sqlSessionFactoryBean.setMapperLocations(arrResource);
//        sqlSessionFactoryBean.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
//        return sqlSessionFactoryBean.getObject();
//    }
//
//
//
//}
