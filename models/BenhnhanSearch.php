<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Benhnhan;

/**
 * BenhnhanSearch represents the model behind the search form about `app\models\Benhnhan`.
 */
class BenhnhanSearch extends Benhnhan
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['tenBN', 'ngaySinh', 'ngheNghiep', 'danToc', 'diaChi', 'anh'], 'safe'],
            [['gioiTinh'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Benhnhan::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'ngaySinh' => $this->ngaySinh,
            'gioiTinh' => $this->gioiTinh,
        ]);

        $query->andFilterWhere(['like', 'tenBN', $this->tenBN])
            ->andFilterWhere(['like', 'ngheNghiep', $this->ngheNghiep])
            ->andFilterWhere(['like', 'danToc', $this->danToc])
            ->andFilterWhere(['like', 'diaChi', $this->diaChi])
            ->andFilterWhere(['like', 'anh', $this->anh]);

        return $dataProvider;
    }
}