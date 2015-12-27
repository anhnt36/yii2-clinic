<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Donthuoc;

/**
 * DonthuocSearch represents the model behind the search form about `app\models\Donthuoc`.
 */
class DonthuocSearch extends Donthuoc
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['donthuoc', 'cachSD', 'ngayKeDon'], 'safe'],
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
        $query = Donthuoc::find();

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
            'ngayKeDon' => $this->ngayKeDon,
        ]);

        $query->andFilterWhere(['like', 'donthuoc', $this->donthuoc])
            ->andFilterWhere(['like', 'cachSD', $this->cachSD]);

        return $dataProvider;
    }
}
