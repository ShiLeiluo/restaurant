package factory;

import java.util.ResourceBundle;

/**
 * ����������dao��serviceʵ��
 * @author Jie.Yuan
 *
 */
public class BeanFactory {
	
	// ���������ļ�
	private static ResourceBundle bundle;
	static {
		bundle = ResourceBundle.getBundle("instance");
	}

	/**
	 * ����ָ����key����ȡ�����ļ���ȡ���ȫ·���� ��������
	 * @return
	 */
	public static <T> T getInstance(String key,Class<T> clazz) {
		String className = bundle.getString(key);
		try {
			return (T) Class.forName(className).newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}










